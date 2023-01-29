from brownie import Privacy, accounts, convert, web3

def main(privacy_addr):
  me = accounts.load("default")
  key = convert.to_bytes("0x609b43dd9aedb1fec20b57e74657cab8", "bytes16")
  privacy = Privacy.at(privacy_addr)
  privacy.unlock(key, {'from':me})