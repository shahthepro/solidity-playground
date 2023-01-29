from brownie import Building, accounts, web3

def main(elevator_addr):
  me = accounts.load("default")
  building = Building.deploy(elevator_addr, {'from': me})
  building.wreckIt({'from':me})