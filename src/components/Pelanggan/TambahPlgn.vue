<template>
    <div>
        <navbar-component></navbar-component>
        <sidebar-component></sidebar-component>
        <div class="content-wrapper">
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">Form Tambah Pelanggan</h1>
                        </div>          
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card card-success">
                                <div class="card-header">
                                    <h3 class="card-title">Data Pelanggan</h3>
                                </div>
                                <form @submit.prevent="tambah">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label>Nama Pelanggan</label>
                                            <input type="text" class="form-control" v-model="data_pelanggan.nama">
                                        </div>                                        
                                        <div class="form-group">
                                            <label>Alamat</label>
                                            <input type="text"  class="form-control" v-model="data_pelanggan.alamat">
                                        </div>
                                        <div class="form-group">
                                            <label>No. Telepon</label>
                                            <input type="text"  class="form-control" v-model="data_pelanggan.no_tlp">
                                        </div>
                                        
                                    
                                    </div>
                                    <div class="card-footer">
                                        <button type="submit" class="btn btn-primary">Simpan</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import Vue from 'vue';

Vue.use(axios);

export default {
    data() {
        return {
            data_pelanggan: {
                nama: '',
                alamat: '',
                no_tlp: '',
            },
        };
    },
    methods: {
        tambah() {
            axios.post('http://localhost:8000/api/createpelanggan', this.data_pelanggan)
                .then(() => {
                    alert("Berhasil Tambah Pelanggan");
                    this.$router.push('/data_pelanggan');
                })
                .catch(error => {
                    console.error(error);
                    alert("Gagal menambahkan pelanggan");
                });
        }
    }
}
</script>
