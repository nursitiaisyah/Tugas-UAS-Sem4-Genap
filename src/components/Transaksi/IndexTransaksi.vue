<template>
    <div>
    <navbar-component></navbar-component>
    <sidebar-component></sidebar-component>
    <div class="content-wrapper">
        <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Data Transaksi </h1>
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
                    <router-link class="btn btn-info mb-2" to="data_transaksi/tambah">
                    <i class="fas fa-plus"></i> Tambah
                    </router-link>
                    <table class="table table-bordered">
                    <thead>
                        <tr>
                        <th style="width: 10px">No</th>
                        <th>Nama Pelanggan</th>
                        <th>Nama Barang</th>
                        <th>Tanggal Transaksi</th>
                        <th>Jumlah</th>
                        <th>Total</th>
                        <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="s in data_transaksi" :key="s.id_transaksi">
                        <td>{{ s.id_transaksi }}</td>
                        <td>{{ s.id_pelanggan }}</td>
                        <td>{{ s.id }}</td>
                        <td>{{ s.tgl_transaksi }}</td>
                        <td>{{ s.jumlah }}</td>
                        <td>{{ s.total }}</td>
                        <td>
                            <div class="btn-group">
                            <!-- <router-link class="btn btn-success" :to="{ name: 'detailmenu', params: { id: s.id } }">Detail</router-link> -->
                            <router-link class="btn btn-warning" :to="{ path: '/data_transaksi/EditTransaksi/' + s.id_transaksi }">Edit</router-link>
                            <button type="button" @click="hapus(s.id_transaksi)" class="btn btn-danger">Hapus</button>
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
        data_transaksi: []
    };
    },
    created() {
    this.userLoad();
    },
    methods: {
    userLoad() {
        axios.get('http://127.0.0.1:8000/api/gettransaksi')
        .then(({ data }) => {
            this.data_transaksi = data;
        });
    },
    hapus(id_transaksi) {
        var url = 'http://127.0.0.1:8000/api/deletetransaksi/' + id_transaksi;
        axios.delete(url)
        .then(() => {
            alert("Sukses delete transaksi");
            location.reload();
        })
        .catch((error) => {
            console.error(error);
            alert("Gagal delete transaksi");
        });
    }
    }
};
</script>
