<template>
    <div>
    <navbar-component></navbar-component>
    <sidebar-component></sidebar-component>
    <div class="content-wrapper">
        <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Data Barang </h1>
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
                    <router-link class="btn btn-info mb-2" to="data_barang/tambah">
                    <i class="fas fa-plus"></i> Tambah
                    </router-link>
                    <table class="table table-bordered">
                    <thead>
                        <tr>
                        <th style="width: 10px">No</th>
                        <th>Kode Barang</th>
                        <th>Nama Barang</th>
                        <th>Merk</th>
                        <th>Harga</th>
                        <th>Stok</th>
                        <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="s in data_barang" :key="s.id">
                        <td>{{ s.id }}</td>
                        <td>{{ s.kode_barang }}</td>
                        <td>{{ s.nama_barang }}</td>
                        <td>{{ s.merk }}</td>
                        <td>{{ s.harga }}</td>
                        <td>{{ s.stok }}</td>
                        <td>
                            <div class="btn-group">
                            <!-- <router-link class="btn btn-success" :to="{ name: 'detailmenu', params: { id: s.id } }">Detail</router-link> -->
                            <router-link class="btn btn-warning" :to="{ path: '/data_barang/EditBrg/' + s.id }">Edit</router-link>
                            <button type="button" @click="hapus(s.id)" class="btn btn-danger">Hapus</button>
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
        data_barang: []
    };
    },
    created() {
    this.userLoad();
    },
    methods: {
    userLoad() {
        axios.get('http://127.0.0.1:8000/api/getbarang')
        .then(({ data }) => {
            this.data_barang = data;
        });
    },
    hapus(id) {
        var url = 'http://127.0.0.1:8000/api/deletebarang/' + id;
        axios.delete(url)
        .then(() => {
            alert("Sukses delete barang");
            location.reload();
        })
        .catch((error) => {
            console.error(error);
            alert("Gagal delete barang");
        });
    }
    }
};
</script>
