module Main where

import Prelude

import React.Basic (Component, JSX, createComponent, make)
import React.Basic.DOM.Events (capture_)
import React.Basic.Native (button) as RN

main :: JSX
main = counter { label : "Increment" }

component :: Component Props
component = createComponent "Counter"

type Props = { label :: String }

counter :: Props -> JSX
counter = make component { initialState, render }
  where
    initialState = { counter: 0 }

    render self = 
      RN.button 
        { onPress: capture_ $ self.setState \s -> s { counter = s.counter + 1 }
        , title: (self.props.label <> ": " <> show self.state.counter)
        }
