<template>
  <div class="hello-world">
    <h2>{{ message }}</h2>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  data() {
    return {
      message: 'Hello from Vue.js!'
    }
  }
}
</script>

<style scoped>
.hello-world {
  text-align: center;
  margin-top: 20px;
}
</style>
