import React, { Component } from 'react';
import Header from "./components/Header"
import MainContent from "./components/MainContent"
import Footer from "./components/Footer"

class MyInfo extends Component {
  constructor(props){
    super(props)
    this.state={
      data: []
    }
  }

  render() {
    const data = this.state.data
    return (
      <div>
        <Header onData={ (data) => this.setState({data})} />
        <MainContent data={ data } />
        <Footer />
      </div>
    )
  }
}

export default MyInfo
