// SPDX-license-identifier: unlicense 
pragma solidity ^0.8.0;

contract Multi_sig{
    // requirement for multi-sig wallet
    address mainOwner;  
    // list of owners
    address[] walletOwners;
    uint transferId = 0;

    uint balances;
    mapping(address => uint) balance;

    struct Transaction{
        address sender;
        address receiver;
        uint amount;
        uint transferId;
        uint approvalCount;
        uint approval_TransactionTime;
    }

    mapping (address => mapping (address => uint256)) private _allowances;
    Transaction[] transaction_request;

    event wallet_ownerAdded(address addedyBy, address newOwner, uint index);
    event wallet_ownerRemoved(address removedBy, address owner_removed, uint index);
    event funds_deposited(address from, uint amount, uint index);
    event funds_withdrawd(address from, uint amount, uint index);
    event tranfer_created(address sender,address receiver,uint amount, uint id, uint approval,uint timestamp);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    
    event SubmitTransaction(
        address indexed owner,
        uint indexed txIndex,
        address indexed to,
        uint value,
        bytes data
    );

    constructor() {
        mainOwner = msg.sender;
        walletOwners.push(msg.sender);
        } 

    modifier onlyOwner() {
         bool isOwner = false;
        for (uint i =0; i < walletOwners.length; i++) {
            if (walletOwners[i] == msg.sender) {
                isOwner = true;
                break;
            }
        }
        require(isOwner == true, 'only wallet owners call this function');
        _;
    }
    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];
    }
    function approve(address owner, address spender, uint256 amount) public returns (bool) {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
        return true;
    }

    }