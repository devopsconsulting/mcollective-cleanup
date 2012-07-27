module MCollective
    module Agent
        class Cleanup<RPC::Agent
            metadata :name        => "Cleanup agent",
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
                    
                    cleanup agent, facts
                rescue LoadError
                    reply[:status] = 0
                    reply[:out] =  "no cleaner found for #{role}, doing nothing."
                    reply[:err] = ""
                end
            end
        end
    end
end