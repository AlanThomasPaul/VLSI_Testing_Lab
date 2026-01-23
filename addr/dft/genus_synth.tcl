set_db library /home/install/FOUNDRY/digital/45nm/dig/lib/typical.lib
read_hdl addr.v
elaborate

syn_generic
syn_map
syn_opt

write_hdl > adder_gates.v
