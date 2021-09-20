pragma solidity ^0.4.22;

contract Forum {
    
    constructor(string _first_msg) public {
        last_msg = _first_msg;
        owner = msg.sender;
    }
    
    string last_msg;
    address owner;
    address owner_last_message;
    uint public total_msgs;

    modifier onlyOwner {
        require(isOwner(), "Only owner can do that!");
        _;
    }
    
    struct log{
        string msg;
        address owner;
    }
    
    log[] public msgs;
    
    mapping (address=>uint) public address2total_msgs;
    

    function seeLastMsg() public view returns(string, address) {
        if (isOwner()) {
            return ("Hey daddy!",owner);
        } else {
            return (last_msg, owner_last_message);
        }
    }

    function setMsg(string _newMsg) public {
        msgs.push(log(_newMsg,msg.sender));
        last_msg= _newMsg;
        owner_last_message=msg.sender;
        total_msgs++;
        address2total_msgs[msg.sender]++;
    }
    
    function isOwner() view private returns(bool) {
        return msg.sender == owner;    
    }
}
