from brownie import PreservationTakeOver, Preservation, accounts

def deploy(preservation_addr):
  me = accounts.load("default")
  t = PreservationTakeOver.deploy({'from': me})
  main(t.address)

def main(preservation_addr, takeover_addr):
  me = accounts.load("default")
  p = Preservation.at(preservation_addr)
  t = PreservationTakeOver.at(takeover_addr)
  p.setFirstTime(takeover_addr, {'from':me})