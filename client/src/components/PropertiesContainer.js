import React, { Component } from 'react';
import { getProperties } from '../api/PropertiesApi'
import MapContainer from './MapContainer'
import PropertyDetailsContainer from './PropertyDetailsContainer'

class PropertiesContainer extends Component {

    constructor(props){
      super(props);
      this.state = {}
      this.detailsCallback = this.detailsCallback.bind(this);
    }

    componentWillMount(){
      this.properties = getProperties();
    }
    
    detailsCallback = (props, marker, e) => {
      this.setState({property: props.details});
    }

    render() {
        return (
            <div className="properties-container">
               <MapContainer data={ this.properties } details={this.detailsCallback} />
               <PropertyDetailsContainer data={this.state.property} />
            </div> 
        )
    }
}

export default PropertiesContainer;