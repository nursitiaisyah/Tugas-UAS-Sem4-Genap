<template>
  <div>
    <navbar-component></navbar-component>
    <sidebar-component></sidebar-component>
    <div class="content-wrapper">
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0">Data Pelanggan</h1>
            </div>
          </div>
        </div>
      </div>

      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card card-primary card-outline">
                <div class="card-body">
                  <router-link class="btn btn-info mb-2" to="data_pelanggan/tambah">
                    <i class="fas fa-plus"></i> Tambah
                  </router-link>
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th style="width: 10px">No</th>
                        <th>Nama Pelanggan</th>
                        <th>Alamat</th>
                        <th>No. Telepon</th>
                        <th>Aksi</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="(pelanggan, index) in data_pelanggan" :key="pelanggan.id_pelanggan">
                        <td>{{ index + 1 }}</td>
                        <td>{{ pelanggan.nama }}</td>
                        <td>{{ pelanggan.alamat }}</td>
                        <td>{{ pelanggan.no_tlp }}</td>
                        <td>
                          <div class="btn-group">
                            <!-- <router-link class="btn btn-success" :to="{ name: 'detailmenu', params: { id: s.id } }">Detail</router-link> -->
                            <router-link class="btn btn-warning" :to="{ path: '/data_pelanggan/EditPlgn/' + pelanggan.id_pelanggan }">Edit</router-link>
                            <button type="button" @click="hapus(pelanggan.id_pelanggan)" class="btn btn-danger">Hapus</button>
                          </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Vue from 'vue';
import axios from 'axios';

Vue.use(axios);

export default {
  data() {
    return {
      data_pelanggan: [],
    };
  },
  created() {
    this.pelangganLoad();
  },
  methods: {
    pelangganLoad() {
      axios.get('http://127.0.0.1:8000/api/getpelanggan')
        .then(({ data }) => {
          this.data_pelanggan = data;
        })
        .catch(error => {
          console.error(error);
        });
    },
    hapus(id_pelanggan) {
      var url = 'http://127.0.0.1:8000/api/deletepelanggan/' + id_pelanggan;
      axios.delete(url)
        .then(() => {
          alert("Sukses delete pelanggan");
          this.pelangganLoad(); // Memuat ulang data pelanggan setelah menghapus
        })
        .catch((error) => {
          console.error(error);
          alert("Gagal delete pelanggan");
        });
    },
  },
};
</script>
