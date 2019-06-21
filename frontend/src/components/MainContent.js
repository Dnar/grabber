import React from "react"
import "./MainContent.css"

function MainContent(props) {
    return (
      <div>
        <div>
          { props.data.map((item) => {
            return (
              <div key={ item.id }>
                <a href={ item.data.html_url }>{ item.data.commit.message }</a>
              </div>
            )
          }) }
        </div>
      </div>
    )
}

export default MainContent
