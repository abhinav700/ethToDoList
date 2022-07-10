import detectEthereumProvider from '@metamask/detect-provider';
import { ethers, Contract } from 'ethers';
import ToDo from './artifacts/contracts/ToDo.sol/ToDo.json';

//utiity code which can be used in most of the dapps
const getBlockchain = () =>
  new Promise( async (resolve, reject) => {
    let provider = await detectEthereumProvider();
    if(provider) {
      await provider.request({ method: 'eth_requestAccounts' });
      const networkId = await provider.request({ method: 'net_version' })
      provider = new ethers.providers.Web3Provider(provider);
      const signer = provider.getSigner();
      //java script obbject which can interact with our contract    
      const todo = new Contract(
        '0x5FbDB2315678afecb367f032d93F642f64180aa3',
        ToDo.abi,
        signer
      );
      resolve({todo});
      return;
    }
    reject('Install Metamask');
 });

export default getBlockchain;