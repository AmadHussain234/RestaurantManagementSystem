﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Restaurant_Managment_System
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void addCustomerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Customer_info ct = new Customer_info();
            ct.Show();
        }

        private void logoutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void homeToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }
    }
}
