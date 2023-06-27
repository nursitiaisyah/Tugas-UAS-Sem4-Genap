<template>
    <div>
        <navbar-component></navbar-component>
        <sidebar-component></sidebar-component>
        <div class="content-wrapper">
            <div class="content-header">
                <div class="container-fluid">
                    <!--<div class="row mb-2">
                        <div class="col-sm-10">
                            <h5 class="m-0">Form Tambah Barang</h5>
                        </div>       
                    </div>-->   
                </div>
            </div>

            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card card-success">
                                <div class="card-header">
                                    <h3 class="card-title">Tambah Data Barang</h3>
                                </div>
                                <form @submit.prevent="tambah">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label>Kode Barang</label>
                                            <input type="text" class="form-control" v-model="data_barang.kode_barang">
                                        </div>                                        
                                        <div class="form-group">
                                            <label>Nama Barang</label>
                                            <input type="text"  class="form-control" v-model="data_barang.nama_barang">
                                        </div>
                                        <div class="form-group">
                                            <label>Merk</label>
                                            <input type="text"  class="form-control" v-model="data_barang.merk">
                                        </div>
                                        <div class="form-group">
                                            <label>Harga</label>
                                            <input type="number"  class="form-control" v-model="data_barang.harga">
                                        </div>
                                        <div class="form-group">
                                            <label>Stok</label>
                                            <input type="number"  class="form-control" v-model="data_barang.stok">
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
            data_barang: {
                kode_barang: '',
                nama_barang: '',
                merk: '',
                harga: 0,
                stok: 0,
            },
        };
    },
    methods: {
        tambah() {
            axios.post('http://localhost:8000/api/createbarang', this.data_barang)
                .then(() => {
                    alert("Berhasil Tambah Barang");
                    this.$router.push('/data_barang');
                })
                .catch(error => {
                    console.error(error);
                    alert("Gagal menambahkan barang");
                });
        }
    }
}
</script>
