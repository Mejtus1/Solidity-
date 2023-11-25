// UNISWAP API code with explenations 
// - to add connectivity to a website button that interacts with a Uniswap trading pair, you'll need to use 
// JavaScript, web3.js (or ethers.js), and Uniswap V2 or V3 smart contracts
// requirements: Node.js, package manager = npm, yarn, ethereum wallet (testying and deploying)

// Create an HTML Button:
// - in your HTML file, create a button that will trigger the Uniswap interaction. 
html
<button id="swapButton">Swap on Uniswap</button>

// Install web3.js (or ethers.js):
// - if you haven't already, install web3.js or ethers.js library
npm install web3

// Add JavaScript Code:
// - In your JavaScript file, you'll need to connect to Ethereum provider (e.g., MetaMask) and
// interact with Uniswap contracts 
const Web3 = require('web3');
const web3 = new Web3(Web3.givenProvider); // Use the provider provided by MetaMask
const uniswapRouterAddress = '0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D0'; // Uniswap Router contract address

document.getElementById('swapButton').addEventListener('click', async () => {
  const accounts = await ethereum.request({ method: 'eth_requestAccounts' }); // Request access to the user's MetaMask accounts

  const uniswapRouter = new web3.eth.Contract(uniswapRouterAbi, uniswapRouterAddress);

  // Specify the details of the swap (input token, output token, amount, etc.)
  const swapDetails = {
    from: accounts[0],
    to: '0x... (output token address)',
    value: web3.utils.toHex(web3.utils.toWei('0.1', 'ether')), // Amount in wei
    data: uniswapRouter.methods.swapExactETHForTokens(0, ['0x... (output token address)'], accounts[0], Date.now() + 1000).encodeABI(),
  };

  // Send the transaction
  web3.eth.sendTransaction(swapDetails, (error, txHash) => {
    if (error) {
      console.error(error);
    } else {
      console.log('Transaction Hash:', txHash);
    }
  });
});

// In this code:
// - replace '0x... (output token address)' with the actual address of output token
// - ensure that you have ABI for Uniswap Router contract (uniswapRouterAbi) and replace '0x... (output token address)' in encodeABI call with appropriate function for your specific swap

// Test in Browser:
// - serve your HTML and JavaScript files using local development server or by opening HTML file in your browser.
// - make sure you have MetaMask (or another Ethereum wallet) installed and connected to Ethereum testnet

// Click Button:
// - when you click "Swap on Uniswap" button, MetaMask will prompt you to confirm transaction
// - once confirmed, swap will be executed



