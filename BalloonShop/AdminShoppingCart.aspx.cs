﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminShoppingCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    // counts old shopping carts
    protected void countButton_Click(object sender, EventArgs e)
    {
      byte days = byte.Parse(daysList.SelectedItem.Value);
      int oldItems = ShoppingCartAccess.CountOldCarts(days);
      if (oldItems == -1)
        countLabel.Text = "Не можахме да ги преброим!";
      else if (oldItems == 0)
        countLabel.Text = "Нама стари колички.";
      else
        countLabel.Text = "Има " + oldItems.ToString() +
                          " стари колички.";
    }


    // deletes old shopping carts
    protected void deleteButton_Click(object sender, EventArgs e)
    {
      byte days = byte.Parse(daysList.SelectedItem.Value);
      ShoppingCartAccess.DeleteOldCarts(days);
      countLabel.Text = "Количката е изтрита.";
    }

}
