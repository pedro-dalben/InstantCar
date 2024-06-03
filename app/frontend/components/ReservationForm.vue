<template>
  <div class="card">
    <div class="card-body">
      <form @submit.prevent="submitForm">
        <div class="mb-3">
          <label for="category" class="form-label">Category</label>
          <Select2
            v-model="filters.category"
            :options="categories"
            @select="fetchOptions('category')"
            class="form-control"
          ></Select2>
        </div>
        <div class="mb-3">
          <label for="brand" class="form-label">Brand</label>
          <Select2
            v-model="filters.brand"
            :options="brands"
            @select="fetchOptions('brand')"
            class="form-control"
          ></Select2>
        </div>
        <div class="mb-3">
          <label for="model" class="form-label">Model</label>
          <Select2
            v-model="filters.model"
            :options="models"
            @select="fetchOptions('model')"
            class="form-control"
          ></Select2>
        </div>
        <div class="mb-3">
          <label for="license_plate" class="form-label">License Plate</label>
          <Select2
            v-model="filters.license_plate"
            :options="
              vehicles.map((vehicle) => ({
                id: vehicle.license_plate,
                text: vehicle.license_plate,
              }))
            "
            @select="fetchOptions('license_plate')"
            class="form-control"
          ></Select2>
        </div>
        <div class="mb-3">
          <label for="client" class="form-label">Client</label>
          <Select2
            v-model="reservation.client_id"
            :options="clients"
            :searchable="true"
            :close-on-select="true"
            :allow-empty="false"
            :custom-label="clientLabel"
            :loading="isLoadingClients"
            class="form-control"
          ></Select2>
        </div>
        <div class="mb-3">
          <label for="start_date" class="form-label">Start Date</label>
          <input
            type="date"
            v-model="reservation.start_date"
            class="form-control"
            required
          />
        </div>
        <div class="mb-3">
          <label for="end_date" class="form-label">End Date</label>
          <input
            type="date"
            v-model="reservation.end_date"
            class="form-control"
            required
          />
        </div>
        <button type="submit" class="btn btn-primary">Save</button>
      </form>
    </div>
  </div>
</template>

<script>
import axios from '../utils/axios'
import Select2 from 'vue3-select2-component'

export default {
  components: {
    Select2,
  },
  props: {
    reservation: {
      type: Object,
      default: () => ({}),
    },
  },
  data() {
    return {
      filters: {
        category: '',
        brand: '',
        model: '',
        license_plate: '',
      },
      categories: [],
      brands: [],
      models: [],
      vehicles: [],
      clients: [],
      clientQuery: '',
      isLoadingClients: false,
    }
  },
  methods: {
    fetchOptions(changedField) {
      const { category, brand, model, license_plate } = this.filters
      axios
        .get('/api/vehicles/options', {
          params: { category, brand, model, license_plate, changedField },
        })
        .then((response) => {
          if (changedField !== 'category')
            this.categories = response.data.categories
          if (changedField !== 'brand') this.brands = response.data.brands
          if (changedField !== 'model') this.models = response.data.models
          if (changedField !== 'license_plate')
            this.vehicles = response.data.vehicles

          if (changedField === 'license_plate' && this.filters.license_plate) {
            const vehicle = response.data.vehicles.find(
              (v) => v.license_plate === this.filters.license_plate
            )
            if (vehicle) {
              this.filters.category = vehicle.category
              this.filters.brand = vehicle.brand
              this.filters.model = vehicle.model
              this.reservation.vehicle_id = vehicle.id
            }
          }
        })
    },
    fetchClients(query) {
      this.isLoadingClients = true
      axios.get(`/api/users`, { params: { query } }).then((response) => {
        this.clients = response.data.map((client) => ({
          id: client.id,
          text: `${client.full_name} - ${client.cpf}`,
        }))
        this.isLoadingClients = false
      })
    },
    clientLabel(client) {
      return `${client.full_name} - ${client.cpf}`
    },
    submitForm() {
      this.$emit('submit', { ...this.reservation })
    },
  },
  created() {
    this.fetchOptions()
    this.fetchClients()
  },
}
</script>
