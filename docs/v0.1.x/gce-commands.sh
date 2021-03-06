# Create root persistent disks and snapshot.
gcutil adddisk census-<control | engine>-disk --size_gb=10 --zone=us-central1-a --source_image=debian-7
gcutil addsnapshot census-engine-snapshot --source_disk=census-engine-disk

# Create needed networks and firewalls for Census Control.
gcutil addnetwork census-framework
gcutil addfirewall census-framework-default --network=census-framework --allowed="tcp:9595"
gcutil addfirewall census-framework-ssh --network=census-framework --allowed="tcp:22"
gcutil addfirewall census-framework-allow-internal --network=census-framework --allowed_ip_sources=10.0.0.0/8 --allowed="tcp:1-65535,udp:1-65535,icmp"

# Create gce instance for Census Control.
gcutil addinstance census-control --disk=census-control-disk,boot --service_account_scope=compute-rw --network=census-framework --zone=us-central1-a --machine_type=n1-highcpu-2

# Create testing gce instance for Census Engine.
gcutil addinstance census-engine-test --disk=census-engine-disk,boot --service_account_scope=storage-ro --network=census-framework --zone=us-central1-a --machine_type=n1-highcpu-2 --metadata=startup-script-url:gs://census-framework/engine-startup.sh

# Get logs from instance.
gcutil getserialportoutput <instance>
