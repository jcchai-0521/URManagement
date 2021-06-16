import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    // jwt生成的token
    token: localStorage.getItem("token"),
    // 登录成功后获取的用户信息
    userInfo: JSON.parse(sessionStorage.getItem("userInfo"))
  },
  mutations: {
    /**
     * 设置token
     * @param state
     * @param token
     * @constructor
     */
    SET_TOKEN: (state, token) => {
      state.token = token;
      localStorage.setItem("token", token);
    },

    /**
     * 设置用户信息
     * @param state
     * @param userInfo
     * @constructor
     */
    SET_USERINFO: (state, userInfo) => {
      state.userInfo = userInfo;
      sessionStorage.setItem("userInfo", JSON.stringify(userInfo));
    },

    /**
     * 移除用户信息和token信息
     * @param state
     * @constructor
     */
    REMOVE_USERINFO: (state) => {
      state.token = "";
      state.userInfo = {};
      localStorage.setItem("token", "");
      sessionStorage.setItem("userInfo", JSON.stringify(""));
    }
  },
  getters:{
    /**
     * 从sessionStorage中获取保存的用户信息
     * @param state
     * @returns {any}
     */
    getUserInfo: state => {
      return JSON.parse(sessionStorage.getItem("userInfo"));
    },

    /**
     * 获取token信息
     * @param state
     * @returns {string}
     */
    getToken: state => {
      return localStorage.getItem("token");
    }
  },
  actions: {
  },
  modules: {
  }
})
