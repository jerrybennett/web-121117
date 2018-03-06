import { Redirect } from 'react-router'
import React from 'react'

const withAuth = (WrappedComponent) => {
  return props => {
    return props.auth.loggingIn || props.auth.loggedIn ?
      (<WrappedComponent />)
        :
      (<Redirect to="/" />)
  }
}

export default withAuth
