<template>
    <div>
        <navbar-component></navbar-component>
        <sidebar-component></sidebar-component>
        <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                <h1 class="m-0">Form Tambah Transaksi</h1>
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
                    <h3 class="card-title">Data Transaksi</h3>
                    </div>
                    <form @submit.prevent="tambah">
                    <div class="card-body">
                        <div class="form-group">
                        <label>Nama Pelanggan</label>
                        <select class="form-control" v-model="data_transaksi.id_pelanggan">
                            <option disabled value="">--Pilih Pelanggan--</option>
                            <option v-for="pelanggan in pelanggan" :key="pelanggan.id_pelanggan" :value="pelanggan.id_pelanggan">
                            {{ pelanggan.nama }}
                            </option>
                        </select>
                        </div>

                        <div class="form-group">
                        <label>Nama Barang</label>
                        <select class="form-control" v-model="data_transaksi.id">
                            <option disabled value="">--Pilih Barang--</option>
                            <option v-for="barang in daftar_barang" :key="barang.id" :value="barang.id">
                            {{ barang.nama_barang }}
                            </option>
                        </select>
                        </div>

                        <div class="form-group">
                        <label>Jumlah</label>
                        <input type="number" class="form-control" v-model="data_transaksi.jumlah">
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
            data_transaksi: {
            id_pelanggan: '',
            id: '',
            jumlah: '',
        },
        pelanggan: [],
        daftar_barang: [],
        };
    },
    created() {
    this.getDataPelanggan();
    this.getDataBarang();
    },
    methods: {
        getDataPelanggan() {
        axios.get('http://localhost:8000/api/getpelanggan')
            .then(response => {
            this.pelanggan = response.data;
            })
            .catch(error => {
            console.error(error);
            });
        },
        getDataBarang() {
        axios.get('http://localhost:8000/api/getbarang')
            .then(response => {
            this.daftar_barang = response.data;
            })
            .catch(error => {
            console.error(error);
            });
        },
        tambah() {
        axios.post('http://localhost:8000/api/createtransaksi', this.data_transaksi)
        .then(() => {
            alert("Berhasil Tambah transaksi");
            this.$router.push('/data_transaksi');
            })
            .catch(error => {
            console.error(error);
            alert("Gagal menambahkan transaksi");
            });
        }
    }
}
</script>
