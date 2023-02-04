from brownie import Trespasser2, accounts, web3, convert

def main(gatekeeper_addr):
  me = accounts.load("default")
  trespasser = Trespasser2.deploy(gatekeeper_addr, {'from': me})
  print("Done")
