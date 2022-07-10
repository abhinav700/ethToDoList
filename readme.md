 # Some basic points to keep in mind:
    1) Make sure you are running the local hardhat blockchain while using this app (npx hardhat node).
    
    2) Through the account from one of these hardhat nodes, deploy your contract to local blockchain network.
       { npx hardhat run --network localhost scripts/deploy.js }
    
    3) After deploying this contract to local network , you will obtain a contract address. paste it in ethereum.js line 16.
    
    4) There is a chance that instead of your local hardhat account, some other account that you usually use is connected to dapp with site/dapp using metamask. So diconnect that account and connect your local imported account using metamask otherwise transaction will happen to that previously connected account and the "insufficient gas ammount " error will take place.
        