import axios from 'axios';
import { propertiesServer, pathConfig } from '../actions/EndPoints'

export function getProperties(){
  var url = propertiesServer + pathConfig.getPropertiesPath
  return axios.get(url)
  .then(response => {
  	return response.data
  })
}