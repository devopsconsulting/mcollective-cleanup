metadata :name        => "CleanUp agent",
    :description => "Perform service specific cleanup tasks before destroying a server",
    :author      => "Lars van de Kerkhof <lars@permanentmarkers.nl>",
    :license     => "GPLv2",
    :version     => "1.0",
    :url         => "https://github.dtc.avira.com/VDT/mcollective-cleanup",
    :timeout     => 600

action "echo", :description "Echos back any message it receives" do
   output :msg,
          :description => "The result of the cleanup action.",
          :display_as  => "Result"
end