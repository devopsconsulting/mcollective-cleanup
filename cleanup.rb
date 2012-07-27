module MCollective
    module Agent
        class CleanUp<RPC::Agent
            metadata :name        => "CleanUp agent",
                     :description => "Perform service specific cleanup tasks before destroying a server",
                     :author      => "Lars van de Kerkhof <lars@permanentmarkers.nl>",
                     :license     => "GPLv2",
                     :version     => "1.0",
                     :url         => "https://github.dtc.avira.com/VDT/mcollective-cleanup",
                     :timeout     => 600

            action "cleanup" do                
                facts = PluginManager["facts_plugin"].get_facts
                role = facts['role']
                
                begin
                    # import the correct cleaner function.
                    require "mcollective/agent/cleaners/#{role}"
                    
                    reply[:msg] = clean facts
                rescue LoadError
                    reply[:msg] =  "no cleaner found for #{role}, doing nothing."
                end
            end
        end
    end
end