metadata :name        => "Cleanup agent",
    :description => "Perform service specific cleanup tasks before destroying a server",
    :author      => "Lars van de Kerkhof <lars@permanentmarkers.nl>",
    :license     => "GPLv2",
    :version     => "1.0",
    :url         => "https://github.dtc.avira.com/VDT/mcollective-cleanup",
    :timeout     => 600

action "cleanup", :description "Perform cleanup specific to the server role." do
   output :status,
       :description => "The status of the cleanup action.",
       :display_as  => "Status"

   output :out,
          :description => "The result of the cleanup action.",
          :display_as  => "Output"

   output :err,
       :description => "Errors that happened while running the cleanup action.",
       :display_as  => "Error"
          
end