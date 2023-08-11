/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */
// 프로젝트/App.js
import React, {Component} from 'react';
import PropTypes from 'prop-types';
import {requireNativeComponent } from 'react-native';
const RNCaulyAdView = requireNativeComponent("RNCaulyAdView");

class CaulyAdView extends Component {
    render() {      
        return (
            <RNCaulyAdView 
                {...this.props}
            />
        );
    }
}

CaulyAdView.propTypes = {

}

export default CaulyAdView;