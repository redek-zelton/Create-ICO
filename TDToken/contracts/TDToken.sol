pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TDToken is ERC20 {

    string public _name;    //Nom token
    string public _symbol;  // Symbol
    uint8 public _decimals; // decimals
    //uint256 public _totalSupply; //totalSupply
    address payable public Admin; // addresse de l'administrateur

    uint256 public convertion = 1000000000000000000; //Eth to Wei
    uint256 private rate = 5000/convertion; // 1 ETH = 5000 TDC
    uint256 private rate1 = 6000/convertion;// 1 ETH = 6000 TDC
    uint256 private rate2 = 7000/convertion;// 1 ETH = 7000 TDC
    /*
    struct Participant {
        uint256 totaltoken;
        address personne;
    }

    Participant[] Liste_Participant;
    //event Bought(uint256 amount);
    */
    constructor(
        uint256 initialSupply,
        address payable admin
    ) ERC20('TDCOIN', 'TDC') public{
        Admin = admin;
        // all ICO supply is in Admin pool
        //_setupDecimals(decimals);
        approve(Admin, initialSupply);
        _mint(Admin, initialSupply);
    }

    //Recevoir des token contre des ethers
    function getToken(uint256 amount, uint256 taux) onlyAllower internal {
        require(amount > 0, "You need to send some ether");
        require(amount*taux <= balanceOf(Admin), "Verification de la pool");
        //emit Bought(amount*taux);
        transferFrom(Admin, msg.sender, amount*taux);
    }
    
    // Create a mapping to track allowed users
    mapping(address => bool) allowlist;
    uint256 public allowlistedNumber = 0;
    event allowlisted(address addr, bool status);
    event Minted(address beneficiary, uint256 tokenAmount);
    
    // Ajout d'un personne pour acheter le token
    // add to allowlist
    function allowlistAddress(address _add) onlyAdmin public{
        require(!allowlist[_add], "Customer must not be in the allowlist.");
        allowlist[_add] = true;
        allowlistedNumber++;
        emit allowlisted(_add, true);
    }

    // Si Allower return true (Modifier)
    modifier onlyAllower {
    require(allowlist[msg.sender]);
        _;
    }

    modifier onlyAdmin {
    require(msg.sender == Admin);
        _;
    }

    //gets called when money is sent to this contract ; Implement multi level distribution pour les allower seulement
    fallback() external payable {
        if (msg.value <10000000000000000) {
        getToken(msg.value, rate); //  petit donnateur 0.01ETH
        }
        if (msg.value >=10000000000000000 && msg.value < 100000000000000000) {
        getToken(msg.value, rate1); //  moyen donnateur 0.01 et 0.1
        }
        if (msg.value >= 100000000000000000) {
        getToken(msg.value, rate2); //  grand donnateur + 0.1
        }
    }

    // admin mint and send to user
    function mint(address _to, uint256 token) onlyAdmin public{
        require(msg.sender == Admin); // only admin
        require(token > 0);
        require(_to !=address(0));
        //le totalSupply va augmenter et le nombre de token de l'adresse bénéficiare
        _mint(_to, token);
        emit Minted(_to, token);
    }
    function send_from_admin(address receiver,uint256 token) onlyAdmin public {
        require(msg.sender == Admin); // only admin
        require(balanceOf(msg.sender) >= token); // suffisance de token
        if(allowlist[msg.sender])
        {
            transfer(receiver, token); 
        }
        else
        {
            allowlistAddress(receiver);
            transfer(receiver, token);
        }
    }

 }