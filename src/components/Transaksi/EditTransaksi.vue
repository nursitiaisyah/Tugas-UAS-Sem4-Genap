<template>
    <div>
        <navbar-component></navbar-component>
        <sidebar-component></sidebar-component>
        <div class="content-wrapper">
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">Form Edit Transaksi</h1>
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
                                    <h3 class="card-title">Edit Transaksi</h3>
                                </div>
                                <form @submit.prevent="edit">
                                    <input type="hidden" v-model="id_transaksi">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label>Nama Pelanggan </label>
                                            <input type="text" class="form-control" v-model="id_pelanggan">
                                        </div> 

                                        <div class="form-group">
                                            <label>Nama Barang </label>
                                            <input type="text" class="form-control" v-model="id">
                                        </div>

                                        <div class="form-group">
                                            <label>Jumlah</label>
                                            <input type="number"  class="form-control" v-model="jumlah">
                                        </div>
                                        
                                    </div>
                                    <div class="card-footer">
                                        <button type="submit" class="btn btn-primary" >Simpan</button>
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
            data_transaksi : [],
            id_transaksi : "",
            id_pelanggan:'',
            id:'',
            jumlah:"",
        }
    },
    created() {  
        this.DataMenu(),
        this.getdetail(this.$route.params.id)
        this.editdata()
    },
    methods : {
        DataMenu(){
            axios.get('http://127.0.0.1:8000/api/gettransaksi')
            .then(
                ({data}) => {
                    this.data_transaksi = data;
                }
            );
        },
        getdetail(id_transaksi){
            axios.get('http://127.0.0.1:8000/api/getid_transaksi/' + id_transaksi)
            .then((response) => {
                console.log(response.data[0])
                this.id_transaksi = response.data[0].id_transaksi

                this.id_pelanggan = response.data[0].id_pelanggan
                this.id = response.data[0].id
                this.jumlah = response.data[0].jumlah
            })
        },
        edit : function (){
            let DataMenu= {
                id_transaksi : this.id_transaksi,
                
                id_pelanggan : this.id_pelanggan,
                id : this.id,
                jumlah : this.jumlah,
            }
            axios.put("http://127.0.0.1:8000/api/updatetransaksi/" + this.id_transaksi , DataMenu)
            .then(
                ({data}) => {
                    alert("Berhasil update Transaksi");
                    this.$router.push('/data_transaksi');
                    this.data_transaksi = data;
                }
            )
        },
    }
}

</script>
