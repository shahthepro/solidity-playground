from brownie import CoinFlipWrecker, accounts, network
import time

def main():
  me = accounts.load("default")
  # # Uncomment to deploy
  # coin_flip_addr = "0xf43863A357872f8A9065b866f27ffED82E42d56a"
  # contract = CoinFlipWrecker.deploy(coin_flip_addr, {'from': me})
  contract = CoinFlipWrecker.at("0xC22A32e54E065f28767AC0bE7E4bEB038929e5A6")

  last_block = 0
  for i in range(10):
    print("Flip #{}".format(i + 1))
    while last_block == network.chain.height:
      print("Waiting for a block to be mined")
      time.sleep(2)
    tx = contract.wreckIt({'from': me})
    last_block = tx.block_number
