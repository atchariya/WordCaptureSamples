namespace WCXExampleCS
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.clickedWordTxt = new System.Windows.Forms.TextBox();
            this.leftContextTxt = new System.Windows.Forms.TextBox();
            this.rightContextTxt = new System.Windows.Forms.TextBox();
            this.paragraphTxt = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 24);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(68, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Clicked word";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 57);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(64, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Left Context";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 88);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(71, 13);
            this.label3.TabIndex = 2;
            this.label3.Text = "Right Context";
            // 
            // clickedWordTxt
            // 
            this.clickedWordTxt.Location = new System.Drawing.Point(95, 24);
            this.clickedWordTxt.Name = "clickedWordTxt";
            this.clickedWordTxt.Size = new System.Drawing.Size(165, 20);
            this.clickedWordTxt.TabIndex = 3;
            // 
            // leftContextTxt
            // 
            this.leftContextTxt.Location = new System.Drawing.Point(95, 57);
            this.leftContextTxt.Name = "leftContextTxt";
            this.leftContextTxt.Size = new System.Drawing.Size(165, 20);
            this.leftContextTxt.TabIndex = 4;
            // 
            // rightContextTxt
            // 
            this.rightContextTxt.Location = new System.Drawing.Point(95, 88);
            this.rightContextTxt.Name = "rightContextTxt";
            this.rightContextTxt.Size = new System.Drawing.Size(165, 20);
            this.rightContextTxt.TabIndex = 5;
            // 
            // paragraphTxt
            // 
            this.paragraphTxt.Location = new System.Drawing.Point(95, 125);
            this.paragraphTxt.Multiline = true;
            this.paragraphTxt.Name = "paragraphTxt";
            this.paragraphTxt.Size = new System.Drawing.Size(165, 75);
            this.paragraphTxt.TabIndex = 6;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(12, 125);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(56, 13);
            this.label4.TabIndex = 7;
            this.label4.Text = "Paragraph";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 231);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.paragraphTxt);
            this.Controls.Add(this.rightContextTxt);
            this.Controls.Add(this.leftContextTxt);
            this.Controls.Add(this.clickedWordTxt);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "Word Capture X Example";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.Closed += new System.EventHandler(this.Form1_Unload);
            
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox clickedWordTxt;
        private System.Windows.Forms.TextBox leftContextTxt;
        private System.Windows.Forms.TextBox rightContextTxt;
        private System.Windows.Forms.TextBox paragraphTxt;
        private System.Windows.Forms.Label label4;
    }
}

