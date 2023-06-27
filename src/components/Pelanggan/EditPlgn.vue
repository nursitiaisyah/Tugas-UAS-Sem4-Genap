<template>
    <div>
        <navbar-component></navbar-component>
        <sidebar-component></sidebar-component>
        <div class="content-wrapper">
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">Form Edit Pelanggan</h1>
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
                                    <h3 class="card-title">Edit Pelanggan</h3>
                                </div>
                                <form @submit.prevent="edit">
                                    <input type="hidden" v-model="id_pelanggan">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label>Nama Pelanggan </label>
                                            <input type="text" class="form-control" v-model="nama">
                                        </div> 

                                        <div class="form-group">
                                            <label>Alamat </label>
                                            <input type="text" class="form-control" v-model="alamat">
                                        </div>

                                        <div class="form-group">
                                            <label>No. Telepon </label>
                                            <input type="text" class="form-control" v-model="no_tlp">
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
            data_pelanggan : [],
            id_pelanggan : "",
            alamat:'',
            no_tlp:'',
        }
    },
    created() {  
        this.DataMenu(),
        this.getdetail(this.$route.params.id)
        this.editdata()
    },
    methods : {
        DataMenu(){
            axios.get('http://127.0.0.1:8000/api/getpelanggan')
            .then(
                ({data}) => {
                    this.data_pelanggan = data;
                }
            );
        },
        getdetail(id_pelanggan){
            axios.get('http://127.0.0.1:8000/api/getid_pelanggan/' + id_pelanggan)
            .then((response) => {
                console.log(response.data[0])
                this.id_pelanggan = response.data[0].id_pelanggan

                this.nama = response.data[0].nama
                this.alamat = response.data[0].alamat
                this.no_tlp = response.data[0].no_tlp
            })
        },
        edit : function (){
            let DataMenu= {
                id_pelanggan : this.id_pelanggan,
                
                nama : this.nama,
                alamat : this.alamat,
                no_tlp : this.no_tlp,
            }
            axios.put("http://127.0.0.1:8000/api/updatepelanggan/" + this.id_pelanggan , DataMenu)
            .then(
                ({data}) => {
                    alert("Berhasil update Barang");
                    this.$router.push('/data_pelanggan');
                    this.data_pelanggan = data;
                }
            )
        },
    }
}

</script>
