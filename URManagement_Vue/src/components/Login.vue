<template>
  <div>
    <div class="login_container">
      <div class="login_box">
        <div class="avatar_box">
          <!--头像-->
          <img src="../assets/logo.jpg" alt />
        </div>
        <!--添加表单-->
        <el-form
            ref="loginFormRef"
            :model="loginForm"
            :rules="loginRules"
            class="login_form"
            label-width="0px"
        >
          <el-form-item prop="username">
            <el-input v-model="loginForm.username" prefix-icon="iconfont icondenglu"></el-input>
          </el-form-item>
          <el-form-item prop="password">
            <el-input v-model="loginForm.password" prefix-icon="iconfont iconmima" type="password"></el-input>
          </el-form-item>
          <el-form-item class="btns">
            <el-button type="primary" @click="login">登录</el-button>
            <el-button type="info" @click="resetLoginForm">重置</el-button>
          </el-form-item>
        </el-form>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Login",
  data(){
    return {
      loginForm: {
        username: "admin",
        password: "123456"
      },
      loginRules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" },
          { min: 5, max: 8, message: "长度在 5 到 8 个字符", trigger: "blur" }
        ],
        password: [
          { required: true, message: "请输入密码", trigger: "blur" },
          { min: 6, max: 8, message: "密码为 6~8 位", trigger: "blur" }
        ]
      }
    }
  },
  methods: {
    resetLoginForm() {
      this.$refs.loginFormRef.resetFields();
    },
    login() {
      this.$refs.loginFormRef.validate(async valid => {
        if (valid) {
          const _this = this;
          this.$axios.post("/login", this.loginForm).then(resp => {
            // 将获取到的token和用户信息设置到全局对象中
            const token = resp.headers["authorization"];
            const userInfo = resp.data.data;

            // 将用户信息保存起来
            _this.$store.commit("SET_TOKEN", token);
            _this.$store.commit("SET_USERINFO", userInfo);

            // 跳转到主页面
            _this.$router.push("/main")
          });





        } else {
          console.log('error submit!!');
          return false;
        }
      });
    }
  }
}
</script>

<style lang="less" scoped>

// 跟节点样式
.login_container {
  background-color: #2b4b6b;
  height: 100%;
}
// 登录框
.login_box {
  width: 450px;
  height: 300px;
  background-color: #fff;
  border-radius: 3px;// 圆角
  position: absolute;// 绝对定位
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);// 根据自己位置 以自己为长度位移
  // 头像框
  .avatar_box {
    width: 130px;
    height: 130px;
    border: 1px solid #eee;
    border-radius: 50%; // 加圆角
    padding: 10px;
    box-shadow: 0 0 10px #ddd;// 盒子阴影
    position: absolute;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #0ee;
    img {
      width: 100%;
      height: 100%;
      border-radius: 50%; // 加圆角
      background-color: #eee;
    }
  }
  .btns {
    display: flex;// 弹性布局
    justify-content: flex-end; // 尾部对齐
  }
  .login_form {
    position: absolute;
    bottom: 0%;
    width: 100%;
    padding: 0 10px;
    box-sizing: border-box;// 设置边框
  }
}
</style>