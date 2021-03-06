/**
 * Created by estebankramer on 03/12/2019.
 */

import React from 'react'
import { Link } from 'react-router-dom';
import Select from 'react-select';
import queryString from 'query-string';
import moment from 'moment';

import { ApiClient } from '../../utils/apiClient';
import i18n from "../../i18n";

class SearchBar extends React.Component {
  _isMounted = false;
  constructor(props){
    super(props);
    this.API = new ApiClient();
    this.state = {
      insurances: [],
      selectedInsurance: null,
      specialties: [],
      selectedSpecialty: null,
      selectedName: '',
      searchQuery: ''
    };
  }



  async componentDidMount() {
    this._isMounted = true;
    const lastUpdate = await localStorage.getItem('lastUpdate');
    if(moment.duration(moment().diff(lastUpdate)).asMinutes() < 3) {
      const insurances = await localStorage.getItem('insurances');
      const specialties = await localStorage.getItem('specialties');
      if(this._isMounted) {
        this.setState({ insurances: JSON.parse(insurances), specialties: JSON.parse(specialties) })
      }
    } else {
      this.API.get('/homeinfo').then(response => {
        let specialties = [];
        let insurances = [];
        response.data.specialties.map(specialty => specialties.push({value: specialty, label: specialty}))
        response.data.insurances.map(insurance => insurances.push({value: insurance.name, label: insurance.name}))
        if(this._isMounted) {
          this.setState({ insurances, specialties });
          localStorage.setItem('insurances', JSON.stringify(insurances));
          localStorage.setItem('specialties', JSON.stringify(specialties));
          localStorage.setItem('lastUpdate', moment())
        }
      })
    }
  }

  componentWillUnmount() {
    this._isMounted = false;
  }

  async handleChange(e) {
    const { name, value } = e.target;
    await this.setState({ [name]: value });
    this.buildString();
  }

  async handleSelect(e, type) {
    if(type === 'specialty'){
      await this.setState({ selectedSpecialty: e });
    } else {
      await this.setState({ selectedInsurance: e });
    }
    this.buildString();
  }

  buildString() {
    const { selectedName, selectedInsurance, selectedSpecialty } = this.state;
    const name = selectedName === '' ? null : selectedName;
    const insurance = selectedInsurance ? selectedInsurance.label : null;
    const specialty = selectedSpecialty ? selectedSpecialty.label : null;

    let searchQuery = queryString.stringify({ name, insurance, specialty }, { skipNull: true });
    this.setState({ searchQuery })
  }

  render() {
    const { insurances, selectedInsurance, specialties, selectedSpecialty, selectedName } = this.state;
    const { dark } = this.props;
    const customStyles = {
      control: (base, state) => ({
        ...base,
        boxShadow: state.isFocused ? 0 : 0,
        borderColor: dark ? '#FFF' :'#ced4da',
        '&:hover': {
          borderColor: dark ? '#FFF' :'#ced4da',
        }
      })
    };

    return(
      <form>
        <div className="form-row">
          <div className="form-group mb-0 col-md-5 mr-0">
            <input
              type="text"
              aria-label={i18n.t('home.labelDoctor')}
              placeholder={i18n.t('home.placeHolderDoctor')}
              className="form-control"
              name="selectedName"
              value={selectedName}
              style={dark ? { borderColor: '#FFF' } : {}}
              onChange={(e)=> this.handleChange(e)}
            />
          </div>
          <div className="form-group mb-0 col-md-3">
            <Select
              value={selectedSpecialty}
              onChange={(e) => this.handleSelect(e, 'specialty')}
              options={specialties}
              placeholder={i18n.t('home.placeHolderSpeciality')}
              loadingMessage={() => <p className="w-text-light mb-0">{i18n.t('home.loadingSpecialties')}</p>}
              styles={customStyles}
              isLoading={specialties.length === 0 }
            />
          </div>
          <div className="form-group mb-0 col-md-3">
            <Select
              value={selectedInsurance}
              onChange={(e) => this.handleSelect(e, 'insurance')}
              options={insurances}
              placeholder={i18n.t('home.placeHolderInsurance')}
              styles={customStyles}
              isLoading={insurances.length === 0 }
              loadingMessage={() => <p className="w-text-light mb-0">{i18n.t('home.loadingInsurances')}</p>}
            />
          </div>
          <div className="col-md-1 pl-1 pr-0 mr-0">
            <Link className={'btn btn-block ' + (dark? 'btn-light' : 'btn-primary custom-btn') } to={'/specialists?' + this.state.searchQuery } style={{ textDecoration: 'none', color: dark? '#000' : '#FFF' }}>
                {i18n.t('home.searchButton')}
            </Link>
          </div>
        </div>
      </form>
    );
  }
}

export default SearchBar;
