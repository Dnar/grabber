import React from "react"
import "./Header.css"

export default class Header extends React.Component{
  constructor(props){
    super(props)
    this.state={
      owner: 'Dnar',
      repo: 'grabber',
      author_email: 'chanky@list.ru'
    }
  }
  render() {
    const {
      owner, repo, author_email
    }=this.state
      return (
        <nav className="bp3-navbar bp3-dark">
          <div className="bp3-navbar-group bp3-align-left">
            <div className="bp3-navbar-heading">Fetch commits</div>
            <form onSubmit={this.onSubmit}>
              <input className="bp3-input" placeholder="owner" type="text" value={owner} onChange={this.onOwnerChange} />
              <input className="bp3-input" placeholder="repo" type="text" value={repo} onChange={this.onRepoChange} />
              <input className="bp3-input" placeholder="author email" type="text" value={author_email} onChange={this.onEmailChange} />
              <button className="bp3-button bp3-minimal bp3-icon-cloud-download">Download</button>
            </form>
          </div>
        </nav>
      )
    }

    onOwnerChange=(event) => {
      this.setState({owner: event.target.value})
    }

    onRepoChange=(event) => {
      this.setState({repo: event.target.value})
    }

    onEmailChange=(event) => {
      this.setState({author_email: event.target.value})
    }

    onSubmit=(event) => {
      event.preventDefault()
      const {
        owner, repo, author_email
      }=this.state

      fetch('/api/v1/fetch_and_save_commits/', {
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          owner, repo, author_email
        })
      })
      .then( (res) => res.json() )
      .then( (data) => {this.props.onData(data)} )
    }
  }
