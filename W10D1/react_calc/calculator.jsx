import React from "react";

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        num1: "",
        num2: "",
        result: 0
    }
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.calculate = this.calculate.bind(this);
  }

  setNum1(e) {
    this.setState({num1: e.target.value});
  }

  setNum2(e) {
    this.setState({num2: e.target.value});
  }

  calculate(op) {
    e.preventDefault()
    let {num1 , num2} = this.state;
    switch(op) {
        case "+":
            this.setState({result: Number(num1) + Number(num2)})
            break;
        case "-":
            this.setState({result: num1 - num2})
            break;
        case "*":
            this.setState({result: num1 * num2})
            break;
        case "/":
            this.setState({result: num1 / num2})
            break;
        default:
            this.setState({result: ""})
    }
  }
  render() {
    return (
      <div>
        <h1>Calculator</h1>
        <h2>Result: {this.state.result}</h2>
        <input type="text" onChange={e => this.setNum1(e)} value={this.state.num1}/>
        <input type="text" onChange={e => this.setNum2(e)} value={this.state.num2}/>
        <button onClick={() => this.calculate("*")}>*</button>
        <button onClick={() => this.calculate("+")}>+</button>
        <button onClick={() => this.calculate("-")}>-</button>
        <button onClick={() => this.calculate("/")}>/</button>
      </div>
    );
  }
}

export default Calculator;