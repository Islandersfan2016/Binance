pragma solidity ^0.8.2;

contract Token {
	mapping(address => uint) public balances;
	mapping(address => mapping(address => uint)) public allowances;
	0x89428924248
	-> 0x889329849842 => 10000
	-> 0x88942984eqqe2 =>20000
	-> 0x8942892eq2 => 30000;
	uint public totalSupply = 10000;
	string public name = "My Token";
	string public symbol = "TKN";
	uint public decimals = 18;

	event Transfer(address indexed from, address indexed to, uint value);
	event Approval(address indexed owner, address indexed spender, uint value);

	constructor() {
		balances[msg.sender] = totalSupply;
	}

	function balanceOf(address owner) public view returns(uint) {
		return balances[owner];
	}

	function transfer(address to, uint value) public returns(bool) {
		require(balanceOf(msg.sender) >= value, 'balance too low');
		balances[to] += value;
		balances[msg.sender] -= value;
		emit transfer(msg.sender, to, value);
		return true;
	}

	function transferFrom(address from, address to, uint value) public returns(bool) {
		require(balanceOf(from) >= value, 'balance to low');
		require(allowance[from][msg.sender] >= value, 'allowance too low');
		balances[to] += value;
		balances[from] -= value;
		emit Transfer(from, to, value);
		return true;
	}
 
	function approve(address spender, uint value) public returns(bool) {
		allowance[msg.sender][spender] = value;
		emit Approval(msg.sender, spender, value);
		return true;
	}
}

