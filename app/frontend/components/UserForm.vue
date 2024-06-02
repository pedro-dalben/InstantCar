<template>
  <form @submit.prevent="submitForm">
    <div class="form-group">
      <label for="full_name">Full Name</label>
      <input
        type="text"
        v-model="form.full_name"
        class="form-control"
        id="full_name"
        required
      />
    </div>
    <div class="form-group">
      <label for="email">Email</label>
      <input
        type="email"
        v-model="form.email"
        class="form-control"
        id="email"
        required
      />
    </div>
    <div class="form-group">
      <label for="cpf">CPF</label>
      <input
        type="text"
        v-model="form.cpf"
        class="form-control"
        id="cpf"
        required
      />
    </div>
    <div class="form-group">
      <label for="dateOfBirth">Date of Birth</label>
      <input
        type="date"
        v-model="form.birth_date"
        class="form-control"
        id="dateOfBirth"
        required
      />
    </div>
    <div class="form-group form-check">
      <input
        type="checkbox"
        v-model="form.active"
        class="form-check-input"
        id="active"
      />
      <label class="form-check-label" for="active">Active</label>
    </div>
    <div class="form-group">
      <label for="password">Password</label>
      <input
        type="password"
        v-model="form.password"
        class="form-control"
        id="password"
        required
      />
    </div>
    <div class="form-group">
      <label for="passwordConfirmation">Password Confirmation</label>
      <input
        type="password"
        v-model="form.passwordConfirmation"
        class="form-control"
        id="passwordConfirmation"
        required
      />
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</template>

<script>
export default {
  props: {
    user: {
      type: Object,
      default: () => ({}),
    },
  },
  data() {
    return {
      form: {
        full_name: this.user.full_name || '',
        email: this.user.email || '',
        cpf: this.user.cpf || '',
        dateOfBirth: this.user.dateOfBirth || '',
        active: this.user.active !== undefined ? this.user.active : true,
        password: '',
        passwordConfirmation: '',
      },
    }
  },
  methods: {
    submitForm() {
      this.$emit('submit', this.form)
    },
  },
}
</script>
