import React, { Component } from 'react';
import {Map, Marker, GoogleApiWrapper} from 'google-maps-react';
 
export class MapContainer extends Component {
  constructor(props){
    super(props)
    this.state = {
      mapData: [],
      initialCenter: {lat: -37.815018, lng: 144.946014}
    }
  }

  componentDidMount(){
    this.props.data.then((values)=> {
      this.setState({
        mapData: values,
        initialCenter: { lat: values[0].latitude, lng: values[0].longitude}
      });
    });
  }

  render() {
    return (
      <Map google={this.props.google} zoom={4} initialCenter = {{ lat: this.state.initialCenter.lat, lng: this.state.initialCenter.lng }}>
      { this.state.mapData.map(property => {
        return (<Marker 
          details = {property}
          onClick = { this.props.details }
          position={{ lat: property.latitude, lng: property.longitude }} />)})
      }
      </Map>
    );
  }
}
 
export default GoogleApiWrapper({
  apiKey: ('')
})(MapContainer)
