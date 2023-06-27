import Vue from 'vue'
import VueRouter from 'vue-router'
import Dashboard from '../views/DashBoard.vue'
//BARANG
import IndexBarang from '../components/Barang/IndexBrg.vue'
import EditBarang from '../components/Barang/EditBrg.vue'
import TambahBarang from '../components/Barang/TambahBrg.vue'
//PELANGGAN
import IndexPelanggan from '../components/Pelanggan/IndexPlgn.vue'
import EditPelanggan from '../components/Pelanggan/EditPlgn.vue'
import TambahPelanggan from '../components/Pelanggan/TambahPlgn.vue'
//TRANSAKSI
import IndexTransaksi from '../components/Transaksi/IndexTransaksi.vue'
import EditTransaksi from '../components/Transaksi/EditTransaksi.vue'
import TambahTransaksi from '../components/Transaksi/TambahTransaksi.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Dashboard',
    component: Dashboard
  },
  
  //BARANG//
  {
    path: '/data_barang',  //INDEX
    name: 'IndexBarang',    
    component: IndexBarang
  },
  {
    path: '/data_barang/EditBrg/:id', //EDIT
    name: 'EditBarang',
    component: EditBarang
  },
  {
    path : '/data_barang/tambah', //TAMBAH
    name : 'TambahBarang',
    component : TambahBarang
},

//PELANGGAN
  {
    path: '/data_pelanggan', //INDEX
    name: 'IndexPelanggan',
    component: IndexPelanggan
  },
  {
    path: '/data_pelanggan/EditPlgn/:id', //EDIT
    name: 'EditPelanggan',
    component: EditPelanggan
  },
  {
    path: '/data_pelanggan/tambah', //TAMBAH
    name: 'TambahPelanggan',
    component: TambahPelanggan
  },
  //TRANSAKSI
  {
    path: '/data_transaksi', //INDEX
    name: 'IndexTransaksi',
    component: IndexTransaksi
  },
  {
    path: '/data_transaksi/EditTransaksi/:id', //EDIT
    name: 'EditTransaksi',
    component: EditTransaksi
  },
  {
    path: '/data_transaksi/tambah', //TAMBAH
    name: 'TambahTransaksi',
    component: TambahTransaksi
  },



]
const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router