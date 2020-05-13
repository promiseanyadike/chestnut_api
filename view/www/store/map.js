import { copy } from '@/utils/helpers';

export const state = () => ({
	index: [],
	price: [],
	about: []
	});	

export const actions = {
	async getHome({ commit }) {
		try {
			// the call returns an object but store store the data attribute in the object in {data}
			let { data } = await this.$axios.get(`http://localhost:4000/getusers`);
			console.log(data)
			// if (data.code == 200) {
			// 	let test = data.store.getusers;
			// 	// console.log(index)
				commit('setIndex', {data});
				console.log({data})
			// }
			return data
		} catch (error) {
			console.log("An error occured", error);
		}
	},
	async getPrice({commit}) {
		try{
			let {data} = await this.$axios.get(`http://localhost:4000/getprices`)
			console.log(data)
				// console.log(index)
				commit('setPrice', {data})
				return data
		} catch(error) {
			console.log("an error occured", error)
		}
	},
	async getAboutPage({commit}) {
		try{
			let {data} = await this.$axios.get(`http://localhost:4000/getdetails`)
			console.log(data)
				commit('setAboutPage', {data})
				return data
		} catch(error) {
			console.log("an error occured", error)
		}
	}
}

export const mutations = {
	setIndex(state, data) {
		state.index = data;
		console.log(state.index)
	},
	setPrice(state, data) {
		state.price = data;
	},
	setAboutPage(state, data) {
		state.about = data;
	}
}
	