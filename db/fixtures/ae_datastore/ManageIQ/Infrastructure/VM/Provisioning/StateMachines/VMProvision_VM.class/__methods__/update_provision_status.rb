#
# Description: This method upates the provision status.
# Required inputs: status
#

prov   = $evm.root['miq_provision']
status = $evm.inputs['status']

unless prov
  $evm.log(:error, "No miq_provision object provided")
  exit(MIQ_STOP)
end

# Update Status for on_entry,on_exit
if $evm.root['ae_result'] == 'ok' || $evm.root['ae_result'] == 'error'
  prov.message = status
end
