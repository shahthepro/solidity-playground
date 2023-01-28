from brownie import TelephoneWrecker, accounts
import time

def deploy(telephone_addr):
  me = accounts.load("default")
  TelephoneWrecker.deploy(telephone_addr, {'from': me})

def main(deployed_addr):
  me = accounts.load("default")
  contract = TelephoneWrecker.at(deployed_addr)
  contract.wreckIt({'from': me})
